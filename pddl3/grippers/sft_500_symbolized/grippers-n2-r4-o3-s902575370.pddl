(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_05 - type_2
obj_01 obj_12 obj_08 obj_11 - type_1
obj_04 obj_09 obj_03 obj_07 - type_3
obj_10 obj_13 obj_06 - object)
(:init
(pred_4 obj_02 obj_03)
(pred_1 obj_02 obj_01)
(pred_1 obj_02 obj_12)
(pred_4 obj_05 obj_07)
(pred_1 obj_05 obj_08)
(pred_1 obj_05 obj_11)
(pred_2 obj_10 obj_09)
(pred_2 obj_13 obj_03)
(pred_2 obj_06 obj_07)
)
(:goal
(and
(pred_2 obj_10 obj_09)
(pred_2 obj_13 obj_04)
(pred_2 obj_06 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_04)))
)
)