(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_05 - type_3
obj_02 obj_01 obj_07 obj_04 - type_2
obj_08 obj_12 obj_10 - type_1
obj_06 obj_09 obj_11 - object)
(:init
(pred_2 obj_03 obj_08)
(pred_1 obj_03 obj_02)
(pred_1 obj_03 obj_01)
(pred_2 obj_05 obj_08)
(pred_1 obj_05 obj_07)
(pred_1 obj_05 obj_04)
(pred_3 obj_06 obj_10)
(pred_3 obj_09 obj_08)
(pred_3 obj_11 obj_12)
)
(:goal
(and
(pred_3 obj_06 obj_10)
(pred_3 obj_09 obj_10)
(pred_3 obj_11 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_03 obj_10)))
)
)