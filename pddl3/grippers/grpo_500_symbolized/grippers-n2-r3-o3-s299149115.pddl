(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_09 - type_1
obj_03 obj_05 obj_02 obj_12 - type_3
obj_06 obj_08 obj_01 - type_2
obj_07 obj_11 obj_04 - object)
(:init
(pred_4 obj_10 obj_08)
(pred_2 obj_10 obj_03)
(pred_2 obj_10 obj_05)
(pred_4 obj_09 obj_06)
(pred_2 obj_09 obj_02)
(pred_2 obj_09 obj_12)
(pred_3 obj_07 obj_06)
(pred_3 obj_11 obj_08)
(pred_3 obj_04 obj_08)
)
(:goal
(and
(pred_3 obj_07 obj_01)
(pred_3 obj_11 obj_01)
(pred_3 obj_04 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_01)))
)
)