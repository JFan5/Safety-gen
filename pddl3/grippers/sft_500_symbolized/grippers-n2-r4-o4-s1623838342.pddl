(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_3
obj_14 obj_09 obj_13 obj_12 - type_1
obj_03 obj_07 obj_10 obj_05 - type_2
obj_11 obj_06 obj_08 obj_01 - object)
(:init
(pred_3 obj_02 obj_10)
(pred_1 obj_02 obj_14)
(pred_1 obj_02 obj_09)
(pred_3 obj_04 obj_05)
(pred_1 obj_04 obj_13)
(pred_1 obj_04 obj_12)
(pred_4 obj_11 obj_10)
(pred_4 obj_06 obj_03)
(pred_4 obj_08 obj_07)
(pred_4 obj_01 obj_10)
)
(:goal
(and
(pred_4 obj_11 obj_05)
(pred_4 obj_06 obj_07)
(pred_4 obj_08 obj_07)
(pred_4 obj_01 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_02 obj_03) (pred_3 obj_04 obj_03))))
  )
)
)