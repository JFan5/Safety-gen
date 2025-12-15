; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 518293227 --problem-name spanner-s4-n3-l4-s518293227
(define (problem spanner-s4-n3-l4-s518293227)
 (:domain spanner)
 (:objects 
     obj_14 - type_4
     obj_01 obj_07 obj_04 obj_10 - type_5
     obj_11 obj_08 obj_02 - type_1
     obj_06 obj_12 obj_13 obj_03 - type_3
     obj_09 obj_05 - type_3
    )
 (:init 
    (pred_3 obj_14 obj_09)
    (pred_3 obj_01 obj_06)
    (pred_1 obj_01)
    (pred_3 obj_07 obj_13)
    (pred_1 obj_07)
    (pred_3 obj_04 obj_06)
    (pred_1 obj_04)
    (pred_3 obj_10 obj_13)
    (pred_1 obj_10)
    (pred_5 obj_11)
    (pred_3 obj_11 obj_05)
    (pred_5 obj_08)
    (pred_3 obj_08 obj_05)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_05)
    (pred_4 obj_09 obj_06)
    (pred_4 obj_03 obj_05)
    (pred_4 obj_06 obj_12)
    (pred_4 obj_12 obj_13)
    (pred_4 obj_13 obj_03)
)
 (:goal
  (and
   (pred_2 obj_11)
   (pred_2 obj_08)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_11)) (not (pred_2 obj_08))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
