(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_05 - type_1
obj_06 obj_09 obj_03 obj_02 - type_2
obj_11 obj_07 obj_10 obj_13 - type_3
obj_08 obj_01 obj_12 - object)
(:init
(pred_3 obj_04 obj_07)
(pred_2 obj_04 obj_06)
(pred_2 obj_04 obj_09)
(pred_3 obj_05 obj_07)
(pred_2 obj_05 obj_03)
(pred_2 obj_05 obj_02)
(pred_4 obj_08 obj_11)
(pred_4 obj_01 obj_10)
(pred_4 obj_12 obj_07)
)
(:goal
(and
(pred_4 obj_08 obj_07)
(pred_4 obj_01 obj_07)
(pred_4 obj_12 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_10)))
)
)