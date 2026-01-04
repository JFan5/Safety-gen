(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_01 - type_1
obj_10 obj_05 obj_06 obj_03 - type_3
obj_11 obj_08 obj_07 - type_2
obj_09 obj_12 obj_04 - object)
(:init
(pred_2 obj_02 obj_11)
(pred_1 obj_02 obj_10)
(pred_1 obj_02 obj_05)
(pred_2 obj_01 obj_07)
(pred_1 obj_01 obj_06)
(pred_1 obj_01 obj_03)
(pred_3 obj_09 obj_11)
(pred_3 obj_12 obj_07)
(pred_3 obj_04 obj_07)
)
(:goal
(and
(pred_3 obj_09 obj_07)
(pred_3 obj_12 obj_11)
(pred_3 obj_04 obj_07)
)
)

(:constraints
  (always (not (pred_2 obj_02 obj_07)))
)
)