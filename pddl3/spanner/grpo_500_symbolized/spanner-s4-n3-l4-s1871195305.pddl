; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1871195305 --problem-name spanner-s4-n3-l4-s1871195305
(define (problem spanner-s4-n3-l4-s1871195305)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_14 obj_08 obj_11 obj_13 - type_5
     obj_12 obj_09 obj_05 - type_1
     obj_03 obj_01 obj_07 obj_10 - type_3
     obj_06 obj_02 - type_3
    )
 (:init 
    (pred_3 obj_04 obj_06)
    (pred_3 obj_14 obj_07)
    (pred_1 obj_14)
    (pred_3 obj_08 obj_03)
    (pred_1 obj_08)
    (pred_3 obj_11 obj_01)
    (pred_1 obj_11)
    (pred_3 obj_13 obj_07)
    (pred_1 obj_13)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_02)
    (pred_5 obj_09)
    (pred_3 obj_09 obj_02)
    (pred_5 obj_05)
    (pred_3 obj_05 obj_02)
    (pred_4 obj_06 obj_03)
    (pred_4 obj_10 obj_02)
    (pred_4 obj_03 obj_01)
    (pred_4 obj_01 obj_07)
    (pred_4 obj_07 obj_10)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_09)
   (pred_2 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_09)) (not (pred_2 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_06)))
  )
)
)
