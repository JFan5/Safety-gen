(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_01 - type_3
obj_09 obj_02 obj_13 obj_10 - type_2
obj_11 obj_07 obj_12 obj_05 - type_1
obj_04 obj_03 obj_06 - object)
(:init
(pred_2 obj_08 obj_11)
(pred_1 obj_08 obj_09)
(pred_1 obj_08 obj_02)
(pred_2 obj_01 obj_12)
(pred_1 obj_01 obj_13)
(pred_1 obj_01 obj_10)
(pred_3 obj_04 obj_05)
(pred_3 obj_03 obj_07)
(pred_3 obj_06 obj_11)
)
(:goal
(and
(pred_3 obj_04 obj_05)
(pred_3 obj_03 obj_05)
(pred_3 obj_06 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_08 obj_05) (pred_2 obj_01 obj_05))))
  )
)
)