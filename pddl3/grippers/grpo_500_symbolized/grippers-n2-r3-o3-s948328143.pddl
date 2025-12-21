(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_08 - type_1
obj_12 obj_04 obj_07 obj_10 - type_3
obj_02 obj_03 obj_01 - type_2
obj_06 obj_09 obj_11 - object)
(:init
(pred_4 obj_05 obj_03)
(pred_2 obj_05 obj_12)
(pred_2 obj_05 obj_04)
(pred_4 obj_08 obj_03)
(pred_2 obj_08 obj_07)
(pred_2 obj_08 obj_10)
(pred_3 obj_06 obj_02)
(pred_3 obj_09 obj_03)
(pred_3 obj_11 obj_03)
)
(:goal
(and
(pred_3 obj_06 obj_03)
(pred_3 obj_09 obj_01)
(pred_3 obj_11 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_01)))
)
)