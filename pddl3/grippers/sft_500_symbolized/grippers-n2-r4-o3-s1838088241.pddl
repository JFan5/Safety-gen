(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_02 - type_3
obj_05 obj_10 obj_11 obj_03 - type_2
obj_06 obj_01 obj_07 obj_04 - type_1
obj_08 obj_12 obj_13 - object)
(:init
(pred_1 obj_09 obj_07)
(pred_3 obj_09 obj_05)
(pred_3 obj_09 obj_10)
(pred_1 obj_02 obj_06)
(pred_3 obj_02 obj_11)
(pred_3 obj_02 obj_03)
(pred_2 obj_08 obj_07)
(pred_2 obj_12 obj_06)
(pred_2 obj_13 obj_06)
)
(:goal
(and
(pred_2 obj_08 obj_04)
(pred_2 obj_12 obj_04)
(pred_2 obj_13 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_04)))
)
)