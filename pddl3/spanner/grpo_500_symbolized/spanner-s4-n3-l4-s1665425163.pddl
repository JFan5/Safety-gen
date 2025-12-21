; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1665425163 --problem-name spanner-s4-n3-l4-s1665425163
(define (problem spanner-s4-n3-l4-s1665425163)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_08 obj_11 obj_05 obj_12 - type_3
     obj_06 obj_10 obj_13 - type_1
     obj_02 obj_07 obj_14 obj_04 - type_2
     obj_03 obj_01 - type_2
    )
 (:init 
    (pred_6 obj_09 obj_03)
    (pred_6 obj_08 obj_04)
    (pred_5 obj_08)
    (pred_6 obj_11 obj_04)
    (pred_5 obj_11)
    (pred_6 obj_05 obj_04)
    (pred_5 obj_05)
    (pred_6 obj_12 obj_04)
    (pred_5 obj_12)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_01)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_01)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_01)
    (pred_3 obj_03 obj_02)
    (pred_3 obj_04 obj_01)
    (pred_3 obj_02 obj_07)
    (pred_3 obj_07 obj_14)
    (pred_3 obj_14 obj_04)
)
 (:goal
  (and
   (pred_1 obj_06)
   (pred_1 obj_10)
   (pred_1 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_10)) (not (pred_1 obj_13))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
