(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_05 - type_1
obj_10 obj_01 obj_06 obj_03 - type_2
obj_08 obj_04 obj_07 - type_3
obj_09 obj_12 obj_11 - object)
(:init
(pred_4 obj_02 obj_07)
(pred_1 obj_02 obj_10)
(pred_1 obj_02 obj_01)
(pred_4 obj_05 obj_07)
(pred_1 obj_05 obj_06)
(pred_1 obj_05 obj_03)
(pred_3 obj_09 obj_08)
(pred_3 obj_12 obj_04)
(pred_3 obj_11 obj_07)
)
(:goal
(and
(pred_3 obj_09 obj_08)
(pred_3 obj_12 obj_08)
(pred_3 obj_11 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_04)))
)
)