(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_02 - type_1
obj_11 obj_01 obj_04 obj_09 - type_3
obj_07 obj_06 obj_08 - type_2
obj_03 obj_05 obj_12 - object)
(:init
(pred_3 obj_10 obj_07)
(pred_4 obj_10 obj_11)
(pred_4 obj_10 obj_01)
(pred_3 obj_02 obj_06)
(pred_4 obj_02 obj_04)
(pred_4 obj_02 obj_09)
(pred_2 obj_03 obj_06)
(pred_2 obj_05 obj_08)
(pred_2 obj_12 obj_08)
)
(:goal
(and
(pred_2 obj_03 obj_08)
(pred_2 obj_05 obj_08)
(pred_2 obj_12 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_08)))
)
)