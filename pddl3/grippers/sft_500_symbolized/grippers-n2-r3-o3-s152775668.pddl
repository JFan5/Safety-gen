(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_03 - type_1
obj_11 obj_09 obj_12 obj_06 - type_3
obj_10 obj_04 obj_01 - type_2
obj_02 obj_05 obj_07 - object)
(:init
(pred_1 obj_08 obj_10)
(pred_4 obj_08 obj_11)
(pred_4 obj_08 obj_09)
(pred_1 obj_03 obj_01)
(pred_4 obj_03 obj_12)
(pred_4 obj_03 obj_06)
(pred_2 obj_02 obj_01)
(pred_2 obj_05 obj_01)
(pred_2 obj_07 obj_10)
)
(:goal
(and
(pred_2 obj_02 obj_04)
(pred_2 obj_05 obj_10)
(pred_2 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_01)))
)
)