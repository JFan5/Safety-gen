(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_1
obj_01 obj_11 obj_09 obj_06 - type_3
obj_13 obj_05 obj_04 obj_10 - type_2
obj_03 obj_07 obj_08 - object)
(:init
(pred_3 obj_02 obj_10)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_11)
(pred_3 obj_12 obj_04)
(pred_4 obj_12 obj_09)
(pred_4 obj_12 obj_06)
(pred_2 obj_03 obj_05)
(pred_2 obj_07 obj_04)
(pred_2 obj_08 obj_04)
)
(:goal
(and
(pred_2 obj_03 obj_04)
(pred_2 obj_07 obj_05)
(pred_2 obj_08 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_04)))
)
)