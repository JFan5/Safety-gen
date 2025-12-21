(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_08 - type_1
obj_13 obj_01 obj_07 obj_11 - type_2
obj_10 obj_05 obj_12 obj_03 - type_3
obj_06 obj_09 obj_14 obj_04 - object)
(:init
(pred_1 obj_02 obj_05)
(pred_3 obj_02 obj_13)
(pred_3 obj_02 obj_01)
(pred_1 obj_08 obj_10)
(pred_3 obj_08 obj_07)
(pred_3 obj_08 obj_11)
(pred_2 obj_06 obj_12)
(pred_2 obj_09 obj_12)
(pred_2 obj_14 obj_05)
(pred_2 obj_04 obj_10)
)
(:goal
(and
(pred_2 obj_06 obj_12)
(pred_2 obj_09 obj_05)
(pred_2 obj_14 obj_12)
(pred_2 obj_04 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_05) (pred_1 obj_08 obj_05))))
  )
)
)