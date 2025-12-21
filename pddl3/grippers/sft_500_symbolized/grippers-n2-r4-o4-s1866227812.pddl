(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_02 - type_1
obj_12 obj_13 obj_03 obj_06 - type_2
obj_08 obj_14 obj_05 obj_01 - type_3
obj_04 obj_09 obj_10 obj_11 - object)
(:init
(pred_1 obj_07 obj_14)
(pred_3 obj_07 obj_12)
(pred_3 obj_07 obj_13)
(pred_1 obj_02 obj_01)
(pred_3 obj_02 obj_03)
(pred_3 obj_02 obj_06)
(pred_2 obj_04 obj_01)
(pred_2 obj_09 obj_05)
(pred_2 obj_10 obj_01)
(pred_2 obj_11 obj_05)
)
(:goal
(and
(pred_2 obj_04 obj_01)
(pred_2 obj_09 obj_08)
(pred_2 obj_10 obj_01)
(pred_2 obj_11 obj_14)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_07 obj_05) (pred_1 obj_02 obj_05))))
  )
)
)