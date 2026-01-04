(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_07 - type_2
obj_06 obj_12 obj_08 obj_03 - type_3
obj_01 obj_13 obj_14 obj_11 - type_1
obj_05 obj_04 obj_02 obj_10 - object)
(:init
(pred_4 obj_09 obj_11)
(pred_1 obj_09 obj_06)
(pred_1 obj_09 obj_12)
(pred_4 obj_07 obj_14)
(pred_1 obj_07 obj_08)
(pred_1 obj_07 obj_03)
(pred_3 obj_05 obj_01)
(pred_3 obj_04 obj_13)
(pred_3 obj_02 obj_01)
(pred_3 obj_10 obj_01)
)
(:goal
(and
(pred_3 obj_05 obj_14)
(pred_3 obj_04 obj_11)
(pred_3 obj_02 obj_11)
(pred_3 obj_10 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_09 obj_14) (pred_4 obj_07 obj_14))))
    (always (not (and (pred_4 obj_09 obj_11) (pred_4 obj_07 obj_11))))
  )
)
)