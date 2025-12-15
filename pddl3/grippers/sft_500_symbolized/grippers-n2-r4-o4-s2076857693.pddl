(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_06 - type_2
obj_08 obj_11 obj_13 obj_02 - type_3
obj_14 obj_03 obj_01 obj_05 - type_1
obj_10 obj_09 obj_07 obj_04 - object)
(:init
(pred_4 obj_12 obj_05)
(pred_1 obj_12 obj_08)
(pred_1 obj_12 obj_11)
(pred_4 obj_06 obj_14)
(pred_1 obj_06 obj_13)
(pred_1 obj_06 obj_02)
(pred_3 obj_10 obj_05)
(pred_3 obj_09 obj_14)
(pred_3 obj_07 obj_05)
(pred_3 obj_04 obj_01)
)
(:goal
(and
(pred_3 obj_10 obj_14)
(pred_3 obj_09 obj_05)
(pred_3 obj_07 obj_03)
(pred_3 obj_04 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_12 obj_05) (pred_4 obj_06 obj_05))))
  )
)
)