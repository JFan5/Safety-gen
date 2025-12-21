; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1792671245 --problem-name spanner-s4-n3-l4-s1792671245
(define (problem spanner-s4-n3-l4-s1792671245)
 (:domain spanner)
 (:objects 
     obj_12 - type_3
     obj_13 obj_07 obj_08 obj_09 - type_5
     obj_04 obj_03 obj_11 - type_4
     obj_14 obj_02 obj_05 obj_10 - type_2
     obj_01 obj_06 - type_2
    )
 (:init 
    (pred_2 obj_12 obj_01)
    (pred_2 obj_13 obj_05)
    (pred_1 obj_13)
    (pred_2 obj_07 obj_02)
    (pred_1 obj_07)
    (pred_2 obj_08 obj_02)
    (pred_1 obj_08)
    (pred_2 obj_09 obj_05)
    (pred_1 obj_09)
    (pred_5 obj_04)
    (pred_2 obj_04 obj_06)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_06)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_06)
    (pred_6 obj_01 obj_14)
    (pred_6 obj_10 obj_06)
    (pred_6 obj_14 obj_02)
    (pred_6 obj_02 obj_05)
    (pred_6 obj_05 obj_10)
)
 (:goal
  (and
   (pred_3 obj_04)
   (pred_3 obj_03)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_03)) (not (pred_3 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
