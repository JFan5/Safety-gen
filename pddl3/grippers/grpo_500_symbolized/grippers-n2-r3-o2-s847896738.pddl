(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_06 obj_10 - type_1
obj_03 obj_07 obj_05 obj_11 - type_3
obj_01 obj_08 obj_04 - type_2
obj_02 obj_09 - object)
(:init
(pred_3 obj_06 obj_04)
(pred_4 obj_06 obj_03)
(pred_4 obj_06 obj_07)
(pred_3 obj_10 obj_04)
(pred_4 obj_10 obj_05)
(pred_4 obj_10 obj_11)
(pred_2 obj_02 obj_01)
(pred_2 obj_09 obj_08)
)
(:goal
(and
(pred_2 obj_02 obj_04)
(pred_2 obj_09 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_01)))
)
)