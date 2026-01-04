(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_10 - type_2
obj_08 obj_05 obj_11 obj_01 - type_1
obj_07 obj_04 obj_14 obj_12 - type_3
obj_06 obj_03 obj_02 obj_13 - object)
(:init
(pred_1 obj_09 obj_12)
(pred_3 obj_09 obj_08)
(pred_3 obj_09 obj_05)
(pred_1 obj_10 obj_14)
(pred_3 obj_10 obj_11)
(pred_3 obj_10 obj_01)
(pred_2 obj_06 obj_07)
(pred_2 obj_03 obj_14)
(pred_2 obj_02 obj_04)
(pred_2 obj_13 obj_07)
)
(:goal
(and
(pred_2 obj_06 obj_14)
(pred_2 obj_03 obj_12)
(pred_2 obj_02 obj_04)
(pred_2 obj_13 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_09 obj_14) (pred_1 obj_10 obj_14))))
  )
)
)