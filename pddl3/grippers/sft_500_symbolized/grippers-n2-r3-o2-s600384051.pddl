(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_03 obj_05 obj_08 obj_11 - type_2
obj_06 obj_10 obj_07 - type_3
obj_04 obj_02 - object)
(:init
(pred_1 obj_09 obj_10)
(pred_3 obj_09 obj_03)
(pred_3 obj_09 obj_05)
(pred_1 obj_01 obj_10)
(pred_3 obj_01 obj_08)
(pred_3 obj_01 obj_11)
(pred_2 obj_04 obj_07)
(pred_2 obj_02 obj_10)
)
(:goal
(and
(pred_2 obj_04 obj_06)
(pred_2 obj_02 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_07)))
)
)