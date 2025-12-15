(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_05 - type_3
obj_08 obj_03 obj_10 obj_06 - type_2
obj_04 obj_01 obj_09 - type_1
obj_11 obj_07 obj_12 - object)
(:init
(pred_1 obj_02 obj_09)
(pred_2 obj_02 obj_08)
(pred_2 obj_02 obj_03)
(pred_1 obj_05 obj_04)
(pred_2 obj_05 obj_10)
(pred_2 obj_05 obj_06)
(pred_4 obj_11 obj_01)
(pred_4 obj_07 obj_04)
(pred_4 obj_12 obj_04)
)
(:goal
(and
(pred_4 obj_11 obj_04)
(pred_4 obj_07 obj_04)
(pred_4 obj_12 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_01)))
)
)