(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_03 - type_1
obj_08 obj_06 obj_07 obj_09 - type_3
obj_01 obj_12 obj_10 - type_2
obj_04 obj_05 obj_02 - object)
(:init
(pred_4 obj_11 obj_10)
(pred_2 obj_11 obj_08)
(pred_2 obj_11 obj_06)
(pred_4 obj_03 obj_01)
(pred_2 obj_03 obj_07)
(pred_2 obj_03 obj_09)
(pred_3 obj_04 obj_10)
(pred_3 obj_05 obj_01)
(pred_3 obj_02 obj_10)
)
(:goal
(and
(pred_3 obj_04 obj_01)
(pred_3 obj_05 obj_12)
(pred_3 obj_02 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_01)))
)
)