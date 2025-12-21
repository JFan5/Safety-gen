; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 126687500 --problem-name spanner-s4-n3-l4-s126687500
(define (problem spanner-s4-n3-l4-s126687500)
 (:domain spanner)
 (:objects 
     obj_10 - type_5
     obj_01 obj_03 obj_13 obj_14 - type_3
     obj_05 obj_07 obj_08 - type_1
     obj_12 obj_04 obj_09 obj_06 - type_2
     obj_11 obj_02 - type_2
    )
 (:init 
    (pred_6 obj_10 obj_11)
    (pred_6 obj_01 obj_12)
    (pred_5 obj_01)
    (pred_6 obj_03 obj_12)
    (pred_5 obj_03)
    (pred_6 obj_13 obj_09)
    (pred_5 obj_13)
    (pred_6 obj_14 obj_12)
    (pred_5 obj_14)
    (pred_4 obj_05)
    (pred_6 obj_05 obj_02)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_02)
    (pred_4 obj_08)
    (pred_6 obj_08 obj_02)
    (pred_3 obj_11 obj_12)
    (pred_3 obj_06 obj_02)
    (pred_3 obj_12 obj_04)
    (pred_3 obj_04 obj_09)
    (pred_3 obj_09 obj_06)
)
 (:goal
  (and
   (pred_1 obj_05)
   (pred_1 obj_07)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_05)) (not (pred_1 obj_07))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_11)))
  )
)
)
