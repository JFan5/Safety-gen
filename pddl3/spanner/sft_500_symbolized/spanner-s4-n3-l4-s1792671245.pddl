; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1792671245 --problem-name spanner-s4-n3-l4-s1792671245
(define (problem spanner-s4-n3-l4-s1792671245)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_13 obj_12 obj_07 obj_09 - type_2
     obj_04 obj_03 obj_14 - type_5
     obj_01 obj_06 obj_08 obj_05 - type_4
     obj_10 obj_02 - type_4
    )
 (:init 
    (pred_1 obj_11 obj_10)
    (pred_1 obj_13 obj_08)
    (pred_4 obj_13)
    (pred_1 obj_12 obj_06)
    (pred_4 obj_12)
    (pred_1 obj_07 obj_06)
    (pred_4 obj_07)
    (pred_1 obj_09 obj_08)
    (pred_4 obj_09)
    (pred_6 obj_04)
    (pred_1 obj_04 obj_02)
    (pred_6 obj_03)
    (pred_1 obj_03 obj_02)
    (pred_6 obj_14)
    (pred_1 obj_14 obj_02)
    (pred_5 obj_10 obj_01)
    (pred_5 obj_05 obj_02)
    (pred_5 obj_01 obj_06)
    (pred_5 obj_06 obj_08)
    (pred_5 obj_08 obj_05)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_03)
   (pred_2 obj_14)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_03)) (not (pred_2 obj_14))))
    (forall (?m - type_3) (at-most-once (pred_1 ?m obj_10)))
  )
)
)
