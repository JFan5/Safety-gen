(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_13 - type_1
obj_07 obj_12 obj_06 obj_03 - type_2
obj_01 obj_08 obj_04 obj_05 - type_3
obj_10 obj_02 obj_14 obj_11 - object)
(:init
(pred_1 obj_09 obj_05)
(pred_3 obj_09 obj_07)
(pred_3 obj_09 obj_12)
(pred_1 obj_13 obj_04)
(pred_3 obj_13 obj_06)
(pred_3 obj_13 obj_03)
(pred_2 obj_10 obj_08)
(pred_2 obj_02 obj_04)
(pred_2 obj_14 obj_08)
(pred_2 obj_11 obj_01)
)
(:goal
(and
(pred_2 obj_10 obj_04)
(pred_2 obj_02 obj_01)
(pred_2 obj_14 obj_04)
(pred_2 obj_11 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_09 obj_08) (pred_1 obj_13 obj_08))))
    (always (not (and (pred_1 obj_09 obj_04) (pred_1 obj_13 obj_04))))
  )
)
)