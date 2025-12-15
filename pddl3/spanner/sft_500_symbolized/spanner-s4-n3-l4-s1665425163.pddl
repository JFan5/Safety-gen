; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1665425163 --problem-name spanner-s4-n3-l4-s1665425163
(define (problem spanner-s4-n3-l4-s1665425163)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_05 obj_07 obj_08 obj_14 - type_2
     obj_13 obj_11 obj_02 - type_3
     obj_12 obj_01 obj_09 obj_10 - type_5
     obj_03 obj_06 - type_5
    )
 (:init 
    (pred_3 obj_04 obj_03)
    (pred_3 obj_05 obj_10)
    (pred_2 obj_05)
    (pred_3 obj_07 obj_10)
    (pred_2 obj_07)
    (pred_3 obj_08 obj_10)
    (pred_2 obj_08)
    (pred_3 obj_14 obj_10)
    (pred_2 obj_14)
    (pred_1 obj_13)
    (pred_3 obj_13 obj_06)
    (pred_1 obj_11)
    (pred_3 obj_11 obj_06)
    (pred_1 obj_02)
    (pred_3 obj_02 obj_06)
    (pred_4 obj_03 obj_12)
    (pred_4 obj_10 obj_06)
    (pred_4 obj_12 obj_01)
    (pred_4 obj_01 obj_09)
    (pred_4 obj_09 obj_10)
)
 (:goal
  (and
   (pred_6 obj_13)
   (pred_6 obj_11)
   (pred_6 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_11)) (not (pred_6 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
