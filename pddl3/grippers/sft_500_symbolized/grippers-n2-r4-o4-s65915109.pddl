(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_07 - type_1
obj_10 obj_01 obj_05 obj_14 - type_2
obj_03 obj_12 obj_13 obj_08 - type_3
obj_11 obj_02 obj_04 obj_09 - object)
(:init
(pred_1 obj_06 obj_13)
(pred_3 obj_06 obj_10)
(pred_3 obj_06 obj_01)
(pred_1 obj_07 obj_03)
(pred_3 obj_07 obj_05)
(pred_3 obj_07 obj_14)
(pred_2 obj_11 obj_03)
(pred_2 obj_02 obj_13)
(pred_2 obj_04 obj_13)
(pred_2 obj_09 obj_03)
)
(:goal
(and
(pred_2 obj_11 obj_13)
(pred_2 obj_02 obj_12)
(pred_2 obj_04 obj_03)
(pred_2 obj_09 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_06 obj_12) (pred_1 obj_07 obj_12))))
    (always (not (and (pred_1 obj_06 obj_13) (pred_1 obj_07 obj_13))))
  )
)
)