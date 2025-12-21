(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_04 - type_1
obj_03 obj_01 obj_06 obj_09 - type_3
obj_10 obj_11 obj_07 - type_2
obj_02 obj_08 obj_12 - object)
(:init
(pred_4 obj_05 obj_11)
(pred_2 obj_05 obj_03)
(pred_2 obj_05 obj_01)
(pred_4 obj_04 obj_10)
(pred_2 obj_04 obj_06)
(pred_2 obj_04 obj_09)
(pred_3 obj_02 obj_10)
(pred_3 obj_08 obj_10)
(pred_3 obj_12 obj_07)
)
(:goal
(and
(pred_3 obj_02 obj_11)
(pred_3 obj_08 obj_07)
(pred_3 obj_12 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_07)))
)
)