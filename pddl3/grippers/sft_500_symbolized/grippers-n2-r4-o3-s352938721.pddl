(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_01 - type_1
obj_06 obj_05 obj_04 obj_07 - type_2
obj_10 obj_08 obj_09 obj_02 - type_3
obj_03 obj_13 obj_12 - object)
(:init
(pred_1 obj_11 obj_10)
(pred_3 obj_11 obj_06)
(pred_3 obj_11 obj_05)
(pred_1 obj_01 obj_09)
(pred_3 obj_01 obj_04)
(pred_3 obj_01 obj_07)
(pred_2 obj_03 obj_02)
(pred_2 obj_13 obj_08)
(pred_2 obj_12 obj_10)
)
(:goal
(and
(pred_2 obj_03 obj_02)
(pred_2 obj_13 obj_02)
(pred_2 obj_12 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_02) (pred_1 obj_01 obj_02))))
  )
)
)