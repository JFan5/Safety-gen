; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 807868820 --problem-name spanner-s4-n3-l4-s807868820
(define (problem spanner-s4-n3-l4-s807868820)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_10 obj_09 obj_01 obj_12 - type_5
     obj_06 obj_08 obj_03 - type_1
     obj_04 obj_13 obj_11 obj_02 - type_3
     obj_14 obj_07 - type_3
    )
 (:init 
    (pred_3 obj_05 obj_14)
    (pred_3 obj_10 obj_04)
    (pred_1 obj_10)
    (pred_3 obj_09 obj_11)
    (pred_1 obj_09)
    (pred_3 obj_01 obj_13)
    (pred_1 obj_01)
    (pred_3 obj_12 obj_11)
    (pred_1 obj_12)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_07)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_07)
    (pred_5 obj_03)
    (pred_3 obj_03 obj_07)
    (pred_4 obj_14 obj_04)
    (pred_4 obj_02 obj_07)
    (pred_4 obj_04 obj_13)
    (pred_4 obj_13 obj_11)
    (pred_4 obj_11 obj_02)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_08)
   (pred_2 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_14)))
  )
)
)
