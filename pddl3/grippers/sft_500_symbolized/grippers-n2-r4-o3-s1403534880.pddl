(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_09 - type_3
obj_11 obj_01 obj_12 obj_03 - type_2
obj_06 obj_04 obj_13 obj_10 - type_1
obj_08 obj_02 obj_05 - object)
(:init
(pred_2 obj_07 obj_10)
(pred_4 obj_07 obj_11)
(pred_4 obj_07 obj_01)
(pred_2 obj_09 obj_13)
(pred_4 obj_09 obj_12)
(pred_4 obj_09 obj_03)
(pred_3 obj_08 obj_04)
(pred_3 obj_02 obj_10)
(pred_3 obj_05 obj_04)
)
(:goal
(and
(pred_3 obj_08 obj_10)
(pred_3 obj_02 obj_10)
(pred_3 obj_05 obj_13)
)
)

(:constraints
  (always (not (pred_2 obj_07 obj_13)))
)
)