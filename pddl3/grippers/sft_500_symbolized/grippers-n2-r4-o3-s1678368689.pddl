(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_06 - type_1
obj_13 obj_05 obj_08 obj_10 - type_2
obj_03 obj_12 obj_07 obj_11 - type_3
obj_01 obj_04 obj_09 - object)
(:init
(pred_1 obj_02 obj_03)
(pred_3 obj_02 obj_13)
(pred_3 obj_02 obj_05)
(pred_1 obj_06 obj_12)
(pred_3 obj_06 obj_08)
(pred_3 obj_06 obj_10)
(pred_2 obj_01 obj_03)
(pred_2 obj_04 obj_07)
(pred_2 obj_09 obj_03)
)
(:goal
(and
(pred_2 obj_01 obj_11)
(pred_2 obj_04 obj_11)
(pred_2 obj_09 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_07) (pred_1 obj_06 obj_07))))
    (always (not (and (pred_1 obj_02 obj_11) (pred_1 obj_06 obj_11))))
  )
)
)