(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_12 - type_1
obj_02 obj_06 obj_09 obj_01 - type_3
obj_13 obj_08 obj_07 obj_03 - type_2
obj_11 obj_10 obj_05 - object)
(:init
(pred_4 obj_04 obj_13)
(pred_2 obj_04 obj_02)
(pred_2 obj_04 obj_06)
(pred_4 obj_12 obj_08)
(pred_2 obj_12 obj_09)
(pred_2 obj_12 obj_01)
(pred_3 obj_11 obj_07)
(pred_3 obj_10 obj_13)
(pred_3 obj_05 obj_13)
)
(:goal
(and
(pred_3 obj_11 obj_03)
(pred_3 obj_10 obj_03)
(pred_3 obj_05 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_04 obj_03) (pred_4 obj_12 obj_03))))
  )
)
)