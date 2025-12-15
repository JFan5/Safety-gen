(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_12 - type_1
obj_05 obj_01 obj_13 obj_06 - type_3
obj_02 obj_09 obj_10 obj_03 - type_2
obj_04 obj_07 obj_11 - object)
(:init
(pred_3 obj_08 obj_09)
(pred_4 obj_08 obj_05)
(pred_4 obj_08 obj_01)
(pred_3 obj_12 obj_02)
(pred_4 obj_12 obj_13)
(pred_4 obj_12 obj_06)
(pred_2 obj_04 obj_10)
(pred_2 obj_07 obj_03)
(pred_2 obj_11 obj_02)
)
(:goal
(and
(pred_2 obj_04 obj_03)
(pred_2 obj_07 obj_03)
(pred_2 obj_11 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_03) (pred_3 obj_12 obj_03))))
  )
)
)