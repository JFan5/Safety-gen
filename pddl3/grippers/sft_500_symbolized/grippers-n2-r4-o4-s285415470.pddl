(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_01 - type_1
obj_14 obj_09 obj_13 obj_04 - type_2
obj_12 obj_08 obj_02 obj_07 - type_3
obj_03 obj_06 obj_05 obj_10 - object)
(:init
(pred_1 obj_11 obj_08)
(pred_3 obj_11 obj_14)
(pred_3 obj_11 obj_09)
(pred_1 obj_01 obj_07)
(pred_3 obj_01 obj_13)
(pred_3 obj_01 obj_04)
(pred_4 obj_03 obj_07)
(pred_4 obj_06 obj_07)
(pred_4 obj_05 obj_02)
(pred_4 obj_10 obj_07)
)
(:goal
(and
(pred_4 obj_03 obj_07)
(pred_4 obj_06 obj_07)
(pred_4 obj_05 obj_07)
(pred_4 obj_10 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_07) (pred_1 obj_01 obj_07))))
  )
)
)