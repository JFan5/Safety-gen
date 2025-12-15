(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_08 obj_02 - type_1
obj_03 obj_09 obj_01 obj_04 - type_3
obj_06 obj_10 obj_07 - type_2
obj_11 obj_05 - object)
(:init
(pred_3 obj_08 obj_10)
(pred_4 obj_08 obj_03)
(pred_4 obj_08 obj_09)
(pred_3 obj_02 obj_10)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_04)
(pred_2 obj_11 obj_06)
(pred_2 obj_05 obj_07)
)
(:goal
(and
(pred_2 obj_11 obj_10)
(pred_2 obj_05 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_07)))
)
)