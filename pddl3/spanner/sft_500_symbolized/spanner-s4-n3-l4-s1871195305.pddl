; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1871195305 --problem-name spanner-s4-n3-l4-s1871195305
(define (problem spanner-s4-n3-l4-s1871195305)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_07 obj_09 obj_08 obj_14 - type_3
     obj_12 obj_13 obj_03 - type_1
     obj_11 obj_06 obj_10 obj_01 - type_2
     obj_05 obj_02 - type_2
    )
 (:init 
    (pred_6 obj_04 obj_05)
    (pred_6 obj_07 obj_10)
    (pred_1 obj_07)
    (pred_6 obj_09 obj_11)
    (pred_1 obj_09)
    (pred_6 obj_08 obj_06)
    (pred_1 obj_08)
    (pred_6 obj_14 obj_10)
    (pred_1 obj_14)
    (pred_2 obj_12)
    (pred_6 obj_12 obj_02)
    (pred_2 obj_13)
    (pred_6 obj_13 obj_02)
    (pred_2 obj_03)
    (pred_6 obj_03 obj_02)
    (pred_4 obj_05 obj_11)
    (pred_4 obj_01 obj_02)
    (pred_4 obj_11 obj_06)
    (pred_4 obj_06 obj_10)
    (pred_4 obj_10 obj_01)
)
 (:goal
  (and
   (pred_5 obj_12)
   (pred_5 obj_13)
   (pred_5 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_13)) (not (pred_5 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_05)))
  )
)
)
