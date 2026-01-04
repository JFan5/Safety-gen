(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_03 - type_1
obj_01 obj_04 obj_05 obj_11 - type_2
obj_12 obj_10 obj_07 - type_3
obj_08 obj_02 obj_09 - object)
(:init
(pred_2 obj_06 obj_12)
(pred_3 obj_06 obj_01)
(pred_3 obj_06 obj_04)
(pred_2 obj_03 obj_12)
(pred_3 obj_03 obj_05)
(pred_3 obj_03 obj_11)
(pred_1 obj_08 obj_10)
(pred_1 obj_02 obj_10)
(pred_1 obj_09 obj_12)
)
(:goal
(and
(pred_1 obj_08 obj_12)
(pred_1 obj_02 obj_07)
(pred_1 obj_09 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_06 obj_07)))
)
)