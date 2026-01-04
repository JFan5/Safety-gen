; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1665425163 --problem-name spanner-s4-n3-l4-s1665425163
(define (problem spanner-s4-n3-l4-s1665425163)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_02 obj_13 obj_10 obj_05 - type_5
     obj_01 obj_07 obj_08 - type_1
     obj_03 obj_12 obj_04 obj_14 - type_4
     obj_09 obj_11 - type_4
    )
 (:init 
    (pred_6 obj_06 obj_09)
    (pred_6 obj_02 obj_14)
    (pred_2 obj_02)
    (pred_6 obj_13 obj_14)
    (pred_2 obj_13)
    (pred_6 obj_10 obj_14)
    (pred_2 obj_10)
    (pred_6 obj_05 obj_14)
    (pred_2 obj_05)
    (pred_4 obj_01)
    (pred_6 obj_01 obj_11)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_11)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_11)
    (pred_5 obj_09 obj_03)
    (pred_5 obj_14 obj_11)
    (pred_5 obj_03 obj_12)
    (pred_5 obj_12 obj_04)
    (pred_5 obj_04 obj_14)
)
 (:goal
  (and
   (pred_1 obj_01)
   (pred_1 obj_07)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_08))))
    (forall (?m - type_2) (at-most-once (pred_6 ?m obj_09)))
  )
)
)
