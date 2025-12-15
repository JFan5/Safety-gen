(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_06 - type_1
obj_12 obj_02 obj_08 obj_09 - type_3
obj_03 obj_07 obj_13 obj_10 - type_2
obj_05 obj_01 obj_14 obj_04 - object)
(:init
(pred_3 obj_11 obj_07)
(pred_4 obj_11 obj_12)
(pred_4 obj_11 obj_02)
(pred_3 obj_06 obj_10)
(pred_4 obj_06 obj_08)
(pred_4 obj_06 obj_09)
(pred_2 obj_05 obj_10)
(pred_2 obj_01 obj_03)
(pred_2 obj_14 obj_10)
(pred_2 obj_04 obj_03)
)
(:goal
(and
(pred_2 obj_05 obj_03)
(pred_2 obj_01 obj_07)
(pred_2 obj_14 obj_03)
(pred_2 obj_04 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_11 obj_03) (pred_3 obj_06 obj_03))))
  )
)
)