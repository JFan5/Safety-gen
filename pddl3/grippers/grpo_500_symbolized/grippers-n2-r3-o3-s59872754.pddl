(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_05 - type_1
obj_06 obj_03 obj_04 obj_11 - type_3
obj_01 obj_08 obj_07 - type_2
obj_09 obj_10 obj_12 - object)
(:init
(pred_3 obj_02 obj_01)
(pred_4 obj_02 obj_06)
(pred_4 obj_02 obj_03)
(pred_3 obj_05 obj_08)
(pred_4 obj_05 obj_04)
(pred_4 obj_05 obj_11)
(pred_2 obj_09 obj_07)
(pred_2 obj_10 obj_01)
(pred_2 obj_12 obj_07)
)
(:goal
(and
(pred_2 obj_09 obj_01)
(pred_2 obj_10 obj_07)
(pred_2 obj_12 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_07)))
)
)