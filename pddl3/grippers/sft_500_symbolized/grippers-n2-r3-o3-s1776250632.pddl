(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_05 - type_1
obj_12 obj_08 obj_10 obj_02 - type_2
obj_11 obj_07 obj_01 - type_3
obj_06 obj_03 obj_04 - object)
(:init
(pred_1 obj_09 obj_07)
(pred_3 obj_09 obj_12)
(pred_3 obj_09 obj_08)
(pred_1 obj_05 obj_11)
(pred_3 obj_05 obj_10)
(pred_3 obj_05 obj_02)
(pred_2 obj_06 obj_11)
(pred_2 obj_03 obj_11)
(pred_2 obj_04 obj_01)
)
(:goal
(and
(pred_2 obj_06 obj_07)
(pred_2 obj_03 obj_01)
(pred_2 obj_04 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_01)))
)
)