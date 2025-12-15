(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_08 - type_1
obj_12 obj_11 obj_09 obj_05 - type_3
obj_04 obj_03 obj_10 obj_07 - type_2
obj_06 obj_13 obj_01 - object)
(:init
(pred_3 obj_02 obj_03)
(pred_4 obj_02 obj_12)
(pred_4 obj_02 obj_11)
(pred_3 obj_08 obj_07)
(pred_4 obj_08 obj_09)
(pred_4 obj_08 obj_05)
(pred_2 obj_06 obj_03)
(pred_2 obj_13 obj_04)
(pred_2 obj_01 obj_07)
)
(:goal
(and
(pred_2 obj_06 obj_10)
(pred_2 obj_13 obj_07)
(pred_2 obj_01 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_02 obj_07) (pred_3 obj_08 obj_07))))
  )
)
)