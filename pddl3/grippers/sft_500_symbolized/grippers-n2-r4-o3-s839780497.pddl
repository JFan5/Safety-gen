(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_13 - type_3
obj_10 obj_01 obj_12 obj_03 - type_1
obj_11 obj_06 obj_04 obj_02 - type_2
obj_08 obj_05 obj_07 - object)
(:init
(pred_4 obj_09 obj_02)
(pred_3 obj_09 obj_10)
(pred_3 obj_09 obj_01)
(pred_4 obj_13 obj_02)
(pred_3 obj_13 obj_12)
(pred_3 obj_13 obj_03)
(pred_1 obj_08 obj_04)
(pred_1 obj_05 obj_11)
(pred_1 obj_07 obj_04)
)
(:goal
(and
(pred_1 obj_08 obj_02)
(pred_1 obj_05 obj_04)
(pred_1 obj_07 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_04)))
)
)