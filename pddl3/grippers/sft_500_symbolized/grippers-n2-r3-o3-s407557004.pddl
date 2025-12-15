(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_10 - type_1
obj_08 obj_03 obj_05 obj_12 - type_3
obj_01 obj_11 obj_07 - type_2
obj_04 obj_09 obj_06 - object)
(:init
(pred_4 obj_02 obj_11)
(pred_1 obj_02 obj_08)
(pred_1 obj_02 obj_03)
(pred_4 obj_10 obj_07)
(pred_1 obj_10 obj_05)
(pred_1 obj_10 obj_12)
(pred_3 obj_04 obj_11)
(pred_3 obj_09 obj_11)
(pred_3 obj_06 obj_01)
)
(:goal
(and
(pred_3 obj_04 obj_11)
(pred_3 obj_09 obj_07)
(pred_3 obj_06 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_07)))
)
)