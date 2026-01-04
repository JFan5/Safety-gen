; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 807868820 --problem-name spanner-s4-n3-l4-s807868820
(define (problem spanner-s4-n3-l4-s807868820)
 (:domain spanner)
 (:objects 
     obj_13 - type_1
     obj_07 obj_09 obj_06 obj_01 - type_3
     obj_10 obj_14 obj_11 - type_2
     obj_12 obj_05 obj_04 obj_03 - type_4
     obj_02 obj_08 - type_4
    )
 (:init 
    (pred_3 obj_13 obj_02)
    (pred_3 obj_07 obj_12)
    (pred_4 obj_07)
    (pred_3 obj_09 obj_04)
    (pred_4 obj_09)
    (pred_3 obj_06 obj_05)
    (pred_4 obj_06)
    (pred_3 obj_01 obj_04)
    (pred_4 obj_01)
    (pred_1 obj_10)
    (pred_3 obj_10 obj_08)
    (pred_1 obj_14)
    (pred_3 obj_14 obj_08)
    (pred_1 obj_11)
    (pred_3 obj_11 obj_08)
    (pred_2 obj_02 obj_12)
    (pred_2 obj_03 obj_08)
    (pred_2 obj_12 obj_05)
    (pred_2 obj_05 obj_04)
    (pred_2 obj_04 obj_03)
)
 (:goal
  (and
   (pred_6 obj_10)
   (pred_6 obj_14)
   (pred_6 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_10)) (not (pred_6 obj_14))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_02)))
  )
)
)
