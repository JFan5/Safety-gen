(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_09 - type_1
obj_07 obj_04 obj_12 obj_06 - type_3
obj_01 obj_10 obj_05 obj_11 - type_2
obj_13 obj_08 obj_02 obj_03 - object)
(:init
(pred_4 obj_14 obj_05)
(pred_2 obj_14 obj_07)
(pred_2 obj_14 obj_04)
(pred_4 obj_09 obj_10)
(pred_2 obj_09 obj_12)
(pred_2 obj_09 obj_06)
(pred_3 obj_13 obj_11)
(pred_3 obj_08 obj_01)
(pred_3 obj_02 obj_01)
(pred_3 obj_03 obj_11)
)
(:goal
(and
(pred_3 obj_13 obj_05)
(pred_3 obj_08 obj_05)
(pred_3 obj_02 obj_05)
(pred_3 obj_03 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_14 obj_05) (pred_4 obj_09 obj_05))))
    (always (not (and (pred_4 obj_14 obj_11) (pred_4 obj_09 obj_11))))
  )
)
)