(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_07 - type_1
obj_11 obj_01 obj_12 obj_10 - type_3
obj_13 obj_08 obj_04 obj_06 - type_2
obj_05 obj_09 obj_03 - object)
(:init
(pred_4 obj_02 obj_04)
(pred_2 obj_02 obj_11)
(pred_2 obj_02 obj_01)
(pred_4 obj_07 obj_13)
(pred_2 obj_07 obj_12)
(pred_2 obj_07 obj_10)
(pred_3 obj_05 obj_08)
(pred_3 obj_09 obj_08)
(pred_3 obj_03 obj_06)
)
(:goal
(and
(pred_3 obj_05 obj_04)
(pred_3 obj_09 obj_04)
(pred_3 obj_03 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_02 obj_08) (pred_4 obj_07 obj_08))))
    (always (not (and (pred_4 obj_02 obj_04) (pred_4 obj_07 obj_04))))
    (always (not (and (pred_4 obj_02 obj_06) (pred_4 obj_07 obj_06))))
  )
)
)