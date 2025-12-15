(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_02 - type_1
obj_05 obj_12 obj_04 obj_09 - type_2
obj_08 obj_07 obj_01 - type_3
obj_06 obj_03 obj_10 - object)
(:init
(pred_4 obj_11 obj_08)
(pred_3 obj_11 obj_05)
(pred_3 obj_11 obj_12)
(pred_4 obj_02 obj_08)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_09)
(pred_2 obj_06 obj_08)
(pred_2 obj_03 obj_07)
(pred_2 obj_10 obj_01)
)
(:goal
(and
(pred_2 obj_06 obj_07)
(pred_2 obj_03 obj_01)
(pred_2 obj_10 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_01)))
)
)