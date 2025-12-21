(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_11 - type_1
obj_06 obj_03 obj_10 obj_12 - type_2
obj_07 obj_01 obj_04 obj_05 - type_3
obj_13 obj_08 obj_09 - object)
(:init
(pred_1 obj_02 obj_07)
(pred_3 obj_02 obj_06)
(pred_3 obj_02 obj_03)
(pred_1 obj_11 obj_07)
(pred_3 obj_11 obj_10)
(pred_3 obj_11 obj_12)
(pred_2 obj_13 obj_01)
(pred_2 obj_08 obj_01)
(pred_2 obj_09 obj_04)
)
(:goal
(and
(pred_2 obj_13 obj_05)
(pred_2 obj_08 obj_01)
(pred_2 obj_09 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_04)))
)
)