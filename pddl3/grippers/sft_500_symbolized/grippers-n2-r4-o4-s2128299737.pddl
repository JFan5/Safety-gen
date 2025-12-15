(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_13 - type_2
obj_11 obj_06 obj_12 obj_05 - type_3
obj_10 obj_07 obj_09 obj_14 - type_1
obj_03 obj_02 obj_01 obj_04 - object)
(:init
(pred_4 obj_08 obj_07)
(pred_1 obj_08 obj_11)
(pred_1 obj_08 obj_06)
(pred_4 obj_13 obj_14)
(pred_1 obj_13 obj_12)
(pred_1 obj_13 obj_05)
(pred_3 obj_03 obj_07)
(pred_3 obj_02 obj_10)
(pred_3 obj_01 obj_07)
(pred_3 obj_04 obj_10)
)
(:goal
(and
(pred_3 obj_03 obj_14)
(pred_3 obj_02 obj_14)
(pred_3 obj_01 obj_10)
(pred_3 obj_04 obj_14)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_08 obj_14) (pred_4 obj_13 obj_14))))
  )
)
)