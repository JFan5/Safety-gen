(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_12 - type_1
obj_04 obj_06 obj_10 obj_01 - type_3
obj_09 obj_08 obj_07 - type_2
obj_05 obj_11 obj_02 - object)
(:init
(pred_4 obj_03 obj_09)
(pred_2 obj_03 obj_04)
(pred_2 obj_03 obj_06)
(pred_4 obj_12 obj_09)
(pred_2 obj_12 obj_10)
(pred_2 obj_12 obj_01)
(pred_3 obj_05 obj_07)
(pred_3 obj_11 obj_08)
(pred_3 obj_02 obj_07)
)
(:goal
(and
(pred_3 obj_05 obj_09)
(pred_3 obj_11 obj_08)
(pred_3 obj_02 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_07)))
)
)